
% Compute the stream function and potential function for the three main
% elemental flows (Uniform, Source & Combined).


function [phi,psi] = potentialflow(vinf,lambda,n)

% Variables

% Vinf - free stream velocity
% lambda  - Vortex strength
% n - n x n matrix value

% input user request for type of flow

flowtype     =   input ('Include Prandtl Tip Loss:   (1 = Uniform,    2 = Source, 3 = combined) ');

% Error handling
% throw an error message when an invalid character string or number is inputed



if isstring(flowtype) || ischar(flowtype)

    ME = MException("Error:Inputvalue","Input value is not an integer");

    throw(ME);



elseif flowtype < 1 || flowtype > 3

    ME = MException("Error:Inputvalue","Input value is not registered with function");

    throw(ME);


end


switch flowtype

    % Compute uniform flow

    case 1

        % Compute laminar flow coordinates

        [x,y] = meshgrid(0:n,0:n) ;

        % Compute potential function

        phi = vinf.*x ;

        % Compute stream function

        psi = vinf.*y ;

        % Plot data

        contour(phi,"r-")

        hold on

        contour(psi,"g-")

        legend("Potential","Stream",Location="southwest")
        title("Flow Plot","FontSize",20)
        xlabel("x")
        ylabel("y")

        hold off

        display(phi)
        display(psi)

    case 2

        % Compute the Source flow coordinates

        [x,y] = meshgrid(-n:n,-n:n) ;

        % Cartesian velocity vectors


        u = (lambda./(2.*pi)).*(x./(x.^2 + y.^2));
        v = (lambda./(2.*pi)).*(y./(x.^2 + y.^2));

        % Find and remove singularity data

        idx = find(isnan(u));
        idx2 = find(isnan(v));

        u(idx) = 0 ;
        v(idx2) = 0 ;


        % Compute potential function

        phi = (lambda./(2.*pi)).*log(sqrt((x.^2 + y.^2)));

        % Find and remove singularity data

        idx3 = find(isinf(phi));

        phi(idx3) = 0 ;

        theta = atan((y./x));

        idx4 = find(isnan(theta));

        theta(idx4) = 0 ;

        % Compute the stream function

        psi = (lambda.*(theta))./(2.*pi);

        % Plot data

        contour(x,y,phi)

        hold on

        quiver(x,y,u,v,0.7)

        legend("Potential",Location="southwest")
        title("Flow Plot","FontSize",20)
        xlabel("x")
        ylabel("y")

        hold off

        display(phi)
        display(psi)


    case 3

        % Compute uniform with source flow

        [x,y] = meshgrid(-n:n,-n:n);

        % Cartesian velocity vectors

        u = (lambda./(2.*pi)).*(x./(x.^2 + y.^2)) + vinf ;
        v = (lambda./(2.*pi)).*(y./(x.^2 + y.^2)) ;

        % Find and remove singularity data

        idx = find(isnan(u));
        idx2 = find(isnan(v));

        u(idx) = 0 ;
        v(idx2) = 0 ;

        % Compute the Potential Function

        phi = (lambda./(2.*pi)).*log(sqrt((x.^2 + y.^2))) + vinf.*x ;

        % Find and remove singularity data

        idx3 = find(isinf(phi));

        phi(idx3) = 0 ; 

        theta = atan((y./x)) ;

        idx4 = find(isnan(theta)) ;

        theta(idx4) = 0 ;

        % Compute the Stream function

        psi = (lambda.*(theta))./(2.*pi) + vinf.*y ;

        % Plot data

        contour(x,y,phi)

        hold on

        quiver(x,y,u,v,0.7)

        title("Flow Plot","FontSize",20)
        xlabel("x")
        ylabel("y")

        hold off

        display(phi)
        display(psi)

end
end
