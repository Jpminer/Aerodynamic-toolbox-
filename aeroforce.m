classdef aeroforce

% Class contains all aerodynamic force functions for 2D and 3D objects

    properties

        rho mustBeInteger
        V  mustBeInteger
        Cl mustBeInteger
        Cd mustBeInteger
        Ca mustBeInteger
        Cn mustBeInteger
        CL mustBeInteger
        CD mustBeInteger

    end

    % Inputs:

    % Aerodynamic force functions for 2D and 3D objects
    % rho - density of air / fluid
    % V - Free stream velocity
    % Ch - Chord


    methods(Static)

        function l = Lift2d(rho,V,ch,Cl)
            l = 0.5.*rho.*V.*ch.*Cl;

        end

        function d = Drag2d(rho,V,ch,Cd)
            d = 0.5.*rho.*V.*ch.*Cd;

        end

        function a = Axialforce2d(rho,V,ch,Ca)
            a = 0.5.*rho.*V.*ch.*Ca;

        end
        function n = Normalforce2d(rho,V,ch,Cn)
            n = 0.5.*rho.*V.*ch.*Cn;
        end


        function L = Lift(rho,V,S,CL)
            L = 0.5.*rho.*V.*S.*CL;

        end

        function D = Drag(rho,V,S,CD)
            D = 0.5.*rho.*V.*S.*CD;

        end
        function A = Axialforce(rho,V,S,CA)
            A = 0.5.*rho.*V.*S.*CA;

        end
        function N = Normalforce(rho,V,S,CN)
            N = 0.5.*rho.*V.*S.*CN;

        end

    end
end