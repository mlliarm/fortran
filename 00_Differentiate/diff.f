!Purpose: Calculation of the first and second derivative of the function f(x) 
!
!Author: MiLia
! 
!Contact: milia@protonmail.com
!	     
!___________________________________________________________________________


       program diafor
	
       implicit none

!	Definition of variables/constants
	
	real*8 diff1,diff2,f,h,cnt		
	parameter(h=1E-5)
	external f

!	Opening files to be written.

	open(1,file='diff1.dat') !1st derivative
	open(2,file='diff2.dat') !2nd derivative

	do cnt=1,20,0.1
		diff1=(f(cnt+h)-f(cnt-h))/(2*h) !1st derivative
	  	diff2=(f(cnt+h)+f(cnt-h)-2*f(cnt))/h**2 !2nd derivative
	  	write(1,*) cnt,diff1
	  	write(2,*) cnt,diff2
	enddo
	
       	 close(1) ! Closing file 1
 	 close(2) ! Closing file 2

	stop
       end

!	Given function
	real*8 function f(x)
	 real*8 x
		f= sin(x*x)*cos*(x*x*x)
	 return 
	end	

