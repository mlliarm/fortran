!Purpose:Arithmetical solution of the ode (boundary conditions problem): 
!
! y''(x)+g(x)*y(x)=S(x) ,y(0)=a,y'(0)=b,a,b=given.
!                         *usually g(x):=k(x)^2
!
!Author: MiLia
!Contact: milia@protonmail.com
!
!------------------------------------------------


	program boundpr
	
	integer n,i
	parameter (n=100000)
	real*8 x(0:n),h,y(0:n),yt,g(0:n),s(0:n),a,b,c,d
	real*8 s1,k1

!Boundary conditions:
	y(0)=1.
	yt=-1.
	x(0)=1.

	x(n)=150.
	h=(x(n)-x(0))/dble(n)
	x(1)=x(0)+h
	y(1)=yt*(x(1)-x(0))+y(0)!all this fuss because
       	                        !in physical systems
                                !we are given y(0),y'(0).
	open(1,file='numerov.dat') 

	write(1,*) x(0),y(0)
	write(1,*) x(1),y(1)
	 do i=2,n
	   x(i)=x(0)+i*h
	   g(i)=k1(x(i))*k1(x(i))   !g=k^2
	   s(i)=s1(x(i))
!	   y(i+1)=2*y(i)-y(i-1), the solution for  g=k=h=0.

	   a=1+h*h*g(i+1)/12.
	   b=1-5*h*h*g(i)/12.
	   c=1+h*h*g(i-1)/12.
	   d=h*h*(s(i+1)+10*s(i)+s(i-1))/12.
	   
!	   y(i+1)=(2*b*y(i)-c*y(i-1)+d)/a
	   y(i)=(2*b*y(i-1)-c*y(i-2)+d)/a
	   write(1,*) x(i),y(i)
	 enddo
	 close(1)
	stop
	end

	real*8 function s1(x)
	real*8 x
	 s1=x
	return
	end

	real*8 function k1(x)
	real*8 x
!	 k1=2*x*x+1
	 k1=1.
	return
	end
