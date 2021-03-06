function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
theta_n = theta(1,:);
X_n = X(:,1);

J_0 = (1/m)*(-y'*(log(sigmoid(X*theta))) - ((1 - y)'*log(1 - sigmoid(X*theta))));
comum = (sigmoid(X*theta) - y);
grad_0 = (1/m)*X_n'*comum;

X(:,1) = [];
X_C = X;

grad_1 = (1/m)*X_C'*comum;
theta(1,:) = [];
theta_C = theta;

r = (lambda/(2*m))*sum(theta_C.*theta_C);
J = J_0 + r;
R = (lambda/m)*theta_C;
grad_1 = grad_1 + R;
k = 0; %row position, can be 0,1,2 or 3 in this case
grad_1 = [grad_1(1:k,:); grad_0; grad_1(k+1:end,:)];
grad = grad_1;

% =============================================================

end
