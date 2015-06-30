!       Purpose: Aritmetic solution of a nonlinear algebric equation f(x)=0
!       Author: MiLia
!       Contact: milia@protonmail.com
!---------------------------------------------------------------------

	program nraph
	
	integer n,i,nf
	parameter(n=1000)
	real*8 x(0:n),xc,e,f,df,r0

	write(*,*) 'Give an estimation of the root x'
        read(*,*) xc
	write(*,*) 'Give tolerance  e'
        read(*,*) e
	
!	e=1E-6
	x(0)=3445.8  !Random starting value
!	xc=9.
!	r0=324.3 

	call nr(x,xc,e,r0,n)
	write(*,*) 'Estimation of the root=',r0
	write(*,*) 'Tolerance ,step=',e,n
	stop
	end


!      Newton-raphson method
       subroutine nr(x,xc,e,r0,nf)
	
       integer nf,i
       real*8 x(0:1000),xc,df,r0,e,f

	x(0)=xc
	do i=0,nf
	   x(i+1)=x(i)-( f(x(i)) /df(x(i)) )
	   print*, x(i),i
	   if (abs(x(i+1)-x(i)).lt.e) goto 10
	enddo
10      r0=x(i)
      return
      end

!     The function f(x) whose roots we're looking for.
      real*8 function f(x)
      real*8 x
	
	f=dcosh(x/3.) -0.5*exp(x)
      return
      end

!     Derivative of the function f(x)
      real*8 function df(x)
      real*8 x

	df=(1./3.)*dsinh(x/3.)-0.5*exp(x)
      return
      end
