def checkWinner(codeList, shoppingCart)
	# WRITE YOUR CODE HERE
	#combining code list
	codeList = codeList.flatten
	#modifying the codeList to handle multiple 'anything' codes
	copy = Array.new
	codeList.each do |e|
	    if e == 'anything'
	       if copy.last.is_a? Integer
	           copy[-1]+=1
	       else
	           copy << 1
	       end
	    else
	        copy << e
	    end
	end

	counter = 0
	anycount = 0
	for i in (0...shoppingCart.length)
	  if copy[counter].is_a? Integer
	      while shoppingCart[i] != copy[counter+1]
	        anycount+=1
	        i+=1
	      end
	      if anycount >= copy[counter]
	          anycount = 0
	          counter+=1
	      else
	          anycount = 0
	          counter = 0
	      end
	  else
	      counter+=1 if shoppingCart[i] == copy[counter]
	  end
	end
	counter == copy.length ? 1 : 0
end
