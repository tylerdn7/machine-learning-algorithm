% simple linear regression problem

clear ; close all; clc

% loading data

data = load("data.dat");
X = data(:,1);
y = data(:,2);
% plotting data

plot(X,y,'rx','MarkerSize',10);
m = length(y);
% X is assigned with bias value

X = [ones(m, 1), data(:,1)];


fprintf('   X   Y\n');
disp(data);

theta = [0;0];
J = 0;

% determinig cost and gradient

for i = 1:5,
  for j = 1:5,
  pred = X * theta;
  error = pred - y;
  sme = error .^ 2;

  vec = [X(:,2),y,pred,error,sme];
  disp(vec);
  alpha = 0.01;
  J = (1 / (2*m)) * sum(sme);
  temp1 = theta(1) - alpha * ((1/m) * sum(error));
  temp2 = theta(2) - alpha * ((1/m) * sum(error) * X(j,2));
  theta(1) = temp1;
  theta(2) = temp2;
  disp(J);
  disp(theta);
  end
end

% Plot the linear fit

hold on; 

% keep previous plot visible

plot(X(:,2), X*theta, '-');