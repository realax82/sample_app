person1={first:'f1',last:'l1'}
person2={first:'f2',last:'l2'}
person3={first:'f3',last:'l3'}

params={father:person1,mother:person2,child:person3}

puts params[:mother][:last]


def score(dice)
    s=0
    h=dice.each_with_object(Array.new(6)){|val,res|
	res[val-1]+=1
    }
    h.each_with_index{|v,i|
	puts("#{(v+1).to_s} rolled up #{v.to_s} times")
    }
    h.each_with_index{|v,i|
	case i+1
	when 1
	    if v>2
		v=1000+(v-3)*100
	    else
		v=v*100
	    end
	when 5
	    if v>2
		v=500+(v-3)*50
	    else
		v=v*50
	    end
	else
	    if v>2
		v=10*(i+1) 
	    else
		v=0
	    end
	end
	puts("#{i+1} brought #{v} points")
	s+=v
    }
    return s
end
