function [int, err, ier] = romberg(f, a, b, tol)
% Set default values for the maximum number of iterations and the format
% for displaying numbers
max_iterations = 10;
format long;
% Make sure that the tolerance and maximum number of iterations are positive
tol = abs(tol);
max_iterations = abs(max_iterations);

% If the tolerance is zero or greater than or equal to one, or the maximum
% number of iterations is less than one, throw an error
if tol == 0 || tol >= 1 || max_iterations < 1
    err('The input is not valid')
end

% Initialize the matrix to store the results and the counter and error
% variables
results = zeros(1, max_iterations+1);
k = 0;
err = 1;
previous_result = 0;

% Perform the iterations until the error is less than the tolerance times
% the previous result
while (err > tol * previous_result)
    % If this is the first iteration, use the trapezoid method to
    % approximate the integral, otherwise use the previous result as an
    % estimate
    if k == 0
        results(k+1) = trapezoid(f, a, b, k+1, 0);
    else
        results(k+1) = trapezoid(f, a, b, k+1, results(k));
    end

    % Use Richardson extrapolation to improve the estimate of the integral
    for j = k:-1:1
        p = 4^(k-j+1);
        results(j) = (p*results(j+1) - results(j))/(p - 1);
    end

    % Save the current result and update the error
    current_result = results(1);
    if k > 1
        err = abs(current_result - previous_result);
    end

    % Save the current result as the previous result and increment the
    % counter
    previous_result = current_result;
    k = k + 1;

    % If the maximum number of iterations has been reached and the error
    % is still greater than the tolerance, set the status to 1 (indicating
    % that the algorithm did not converge), otherwise set the status to 0
    if k == max_iterations && abs(err) > tol
        ier = 1;
        break;
    else
        ier = 0;
    end
end

% Return the final result as the integral
int = current_result;
end

function [result] = trapezoid(f, x, y, k, prev_result)
% Initialize the result variable
result = 0;
% Calculate the length of the interval between the lower and upper bounds
interval_ab = y - x;

% If this is the first iteration, use the basic trapezoid rule to
% approximate the integral, otherwise use the previous result as an
% estimate
if k == 1
    result = (interval_ab/2) * (f(x) + f(y));
else
    for i = 1:2^(k-2)
        result = result + f(x+(2*i-1)*interval_ab/(2^(k-1)));
    end
    result = 0.5*prev_result + (interval_ab/(2^(k-1))) * result;
end
end


%{

To test the function:

For pifunc.m:

f = @pifunc
tol = 1e-14

[int,err,ier]=romberg(f,0,1,tol)

For logderiv.m:

f = @logderiv
tol = 1e-14
e = exp(1)

[int,err,ier]=romberg(f,1,e,tol)

For erfderiv.m over [0,1]:

f = @erfderiv
tol = 1e-14

[int,err,ier]=romberg(f,0,1,tol)

% For comparison:
erf(1)

For erfderiv.m over [0,3]:

f = @erfderiv
tol = 1e-14

[int,err,ier]=romberg(f,0,3,tol)

% For comparison:
erf(3)

%}
