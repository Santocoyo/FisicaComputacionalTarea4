classdef dual1
  %Class for dual1 numbers
  properties
    f0; %function
    f1; %first derivative
  end
  
  methods
    function obj = dual1(g0,g1)
      if(nargin == 1)
        if(isa(g0,'dual1'))
          obj = g0;
        elseif(isnumeric(g0))
          obj.f0 = g0;
          obj.f1 = zeros(size(g0));
        else
          error('operation not supported in dual1 constructor')
        end
      elseif(nargin == 2)
        if(isa(g0,'dual1') || isa(g1,'dual1') )
          error('las componented de dual1 deben ser reales')
        elseif(isequal(size(g0),size(g1)))                
          obj.f0 = g0;
          obj.f1 = g1;         
        else
          error('operation not supported in dual1 constructor')
        end
      else
        error('operation not supported in dual1 constructor')
      end
    end
  end
end
%

      
        
        
        
        
        
        
        
        
      

  
        