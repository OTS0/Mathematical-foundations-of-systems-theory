% Define the transfer function
num = 7;
den = [0.5 1];
sys = tf(num, den);

% Convert the transfer function to a state-space model
sys_ss = ss(sys);

% Compute the spectral density using the pwelch function
dt = 0.1; % Time step for discretization
t = 0:0.1:10; % Time vector
u = randn(size(t)); % Generate random input signal
[y, ~] = lsim(sys_ss, u, t); % Simulate the system response
[psd, freq] = pwelch(y, [], [], [], 1/dt); % Compute the power spectral density

% Plot the spectral density
plot(freq, psd);
xlabel('Frequency');
ylabel('Power Spectral Density');
