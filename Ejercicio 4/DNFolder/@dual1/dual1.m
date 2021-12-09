classdef dual1
  properties
    f0;
    f1;
  endproperties
  methods
    function obj = dual1(g0, g1)
      if(nargin == 1)
        if(isa(g0,'dual1'))
          obj = g0;
        elseif(isnumeric(g0))
          obj.f0 = g0;
          obj.f1 = zeros(size(g0));
        else
          error('Operation not supported in dual1 constructor')
        end
      elseif(nargin==2)
        if(isa(g0, 'dual1') || isa(g1, 'dual1'))
          error('las componentes del dual1 debe ser reales')
        elseif(isequal(size(g0), size(g1)))
          obj.f0 = g0;
          obj.f1 = g1;
        endif
      else
        error('Oparation not supported in dual1 constructor')
      end
    endfunction
  endmethods
endclassdef
