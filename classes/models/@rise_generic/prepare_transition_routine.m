function Qfunc=prepare_transition_routine(obj)
% H1 line
%
% Syntax
% -------
% ::
%
% Inputs
% -------
%
% Outputs
% --------
%
% Description
% ------------
%
% Examples
% ---------
%
% See also: 


Qfunc=@(x)load_transition_matrix;

    function [Q,retcode]=load_transition_matrix(~)
        retcode=0;
        Q=obj.solution.transition_matrices.Q;
    end

end
