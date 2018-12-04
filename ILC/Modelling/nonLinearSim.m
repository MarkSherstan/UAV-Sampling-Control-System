% Parameter estimation fit results for DC motor --> Add this to a single .mat file?
RatedV = 9.6297;
armatureInduc = 7.4126e-06;
noLoadCurrent = 0.48351;
noLoadSpeed = 27.2;
rotorInertia = 9.8946e-06;
stallTorque = 0.68957;
supply4noLoadCurrent = 21.841;

% Get state space - system already in discrete time
[Ad Bd Cd Dd] = ssdata(sysd2);

% Set initial condition x0, time range t, pure time delay n0, relative degree r, and matrix sizes N
x0 = 0;
t = 0:Ts:17.5;
n0 = 0;
r = 1;
N = length(t);

% % Define input vector U and reference J
Uref = [zeros(1,267) 1000*ones(1,N-267)];
Rj = [zeros(1,267) 263.9*ones(1,N-267)]';

% G0 not formulated as initial conditions are 0

% Formulate G
Gvec = zeros(N,1);
rvec = ((r-1):(N-n0-1))';

for ii = 1:length(rvec)
  ApowVec = Ad^rvec(ii);
  Gvec(ii) = Cd*ApowVec*Bd;
end

G = tril(toeplitz(Gvec));

% Define distrubance every 2 rotations or every 3 seconds after t = 1.5s
disturbance = zeros(N,1);
counter = 1;

for ii = 267:length(disturbance)
  if (counter > 534) & (counter < 534+20)
    disturbance(ii,1) = 50;
  elseif counter == 555;
    counter = 1;
  end
counter = counter + 1;
end

% Add a big distrubance after 1 full rotation at about 10.8 s after t = 1.5s
disturbance(2177:2177+150) = 125;

% Set up ILC
jmax = 25;
l0 = 0.95;
q0 = 1;

L = l0 * eye(N,N);
Q = q0 * eye(N,N);
I = eye(N);

Uj = zeros(N,1); Ujold = Uref';
Ej = zeros(N,1); Ejold = Ej;

figure(2)

% Run ILC and plot the response for each iteration
for ii = 1:jmax
  Uj = Q*Ujold + L*Ejold;
  U = [t' Uj]; % Requirment for simulink (needs time stamp)

  simOut = sim('Twist');

  Yj = Y.Data + disturbance;

  Ej = Rj - Yj; Ej(1) = 0;
  Ejold = Ej;
  Ujold = Uj;

  plotter(ii,t,Ej,Yj,Uj,Rj,Uref)
end
