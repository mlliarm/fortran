      subroutine diff(f,p,h,n)

      real*8 f(0:n), p(0:n), h
      integer n, i

	  open (1, file='diff.out') 

	  p(1) = (f(2) - f(1)) / h
	  p(n) = (f(n) - f(n-1)) / h

      do i = 2, n-1
	    p(i) = (f(i+1) - f(i-1)) / 2*h
	  enddo

	  return
	  end



