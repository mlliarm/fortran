!Purpose: Arithmetic calculation of the sin and cosine Fresnel
!         integrals.
!
!Author:  MiLia
!
!Contact: milia@protonmail.com
!----------------------------------------
!	Main program
!-------------------------------------------
	program integr	
        real*8 a,b,e,u,sum1,pi,sf,cf
	integer*8 i,n
	external sf,cf
    	 parameter(a=0,n=1000000)	
!	pi=acos(-1.)
	write(*,*) 'Dwse to b'
	read(*,*) b
	 call simpson(a,b,n,sf)
!	call simpson(a,b,n,cf)
	 stop
	 end
!------------------------------------------------
!	Definition of Simpson Subroutine
	subroutine simpson(a,b,n,f)
	external f
	real*8 a,b,h,f,sum1,u
	integer*8 i,n	
	 u=(b-a)*(f(a)+4*f((a+b)/2.)+f(b))/6.
	h=(b-a)/real(n)
	 sum1=f(a)+f(b)
	do i=1,n-1,2
	 sum1=sum1+4*f(i)
	enddo
	 do i=2,n-2,2
	   sum1=sum1+2*f(i)
	 enddo
	  sum1=(h*sum1)/3.	  
!	   if (u-sum1).gt.1E-6) then
!	     n=2*n
!	     goto 10
!	    else
       	   write(*,*) 'I=',sum1,u
!	  end if 
	   return
	  end
!-------------------------------------------------
!	Define 1st function to be integrated	
	real*8 function cf(x)
	real*8 x	
	 cf=cos(x**2)
	 return
	 end
!--------------------------------------------------	
!	Define 2nd function to be integrated	
	real*8 function sf(x)
	real*8 x	
	 sf=sin(x**2)
	 return
	 end

