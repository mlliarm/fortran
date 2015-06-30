!Author: MiLia
!Date:  10.11.05
!Contact: milia@protonmail.com
!-----------------------
!Purpose: Solving numerically the ode 
!
!y'(x)=f(x,y) using the Euler and Runge-Kutta-4th 
!methods.
!
!Initial condition is provided, as well the 
!as the length of the 1D grid(values of x(0)
!and x(n) ).
!-----------------------------------------------
      program diffeq

      integer i,j,n
      parameter (n=1000)
      real*8 x(0:n),y(0:n),h,k1,k2,k3,k4
      open (1,file='euler.out')  !data from euler method
      open (2,file='rk4.out')    !data from runge-kutta_4th method 

!     Lenght of 1D grid      
      x(0)=0.   !starting point   
      x(n)=500. !ending point

      h=(x(n)-x(0))/dble(n+1) ! Length of Grid=(n+1) times h. 
		              !Thus 'h' is the 'quantum' of the Grid.
!     Initial condition.
      y(0)=1.           

!     The Euler method.
      do i=1,n
         x(i)=x(0)+i*h
         y(i)=y(i-1)+h*f(x(i-1),y(i-1))
         
         write(1,*) x(i-1),y(i-1)
      enddo
      close(1) !closing file 'euler.out'.
     
!     The Runge-Kutta_4th method.
      do i=0,n
        k1=h*f(x(i),y(i))
        k2=h*f(x(i)+h/2.,y(i)+k1/2.)
        k3=h*f(x(i)+h/2.,y(i)+k2/2.)
        k4=h*f(x(i)+h,y(i)+k3)       
        y(i+1)=y(i)+(1./6.)*(k1+2.*k2+2.*k3+k4)

        write(2,*) x(i),y(i)
      enddo
      close(2) !closing file 'rk4.out'

!     End of programm.
      stop
      end
!---------------------
!  Declaration of the function f(x,y).
!  Example: f(x,y)=cos(x,y)	

      real*8 function f(x1,y1)
      real*8 x1,y1      
        f=cos(x1*y1)
      return
      end
