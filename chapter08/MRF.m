classdef MRF
    %MRF Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        W_
        func_
        z_
        x_
        n_
    end
    
    methods
        function n = size(obj)
            n = obj.n_;
        end
        
        function idx = neighbour(obj, i)
            idx = find(obj.W_(i,:));
        end
        
        function v = f(obj, i, j)
            v = obj.func_(obj.z_(i),obj.z_(j),obj.W_(i,j));
        end
    end
    
end
