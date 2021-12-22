!Purpose: Calculation of the first and second derivative of the function f(x) 
!
!Author: MiLia (2005-2009)
!___________________________________________________________________________

      program diafor
      implicit none
!     Definition of variables/constants
      real*8 diff1, diff2, f, h, x ! Double Precision vars
      integer i
      parameter(h=1.0E-5)
      external f

!     Opening files to be written.
      open(1, file='diff1.dat') !1st derivative
      open(2, file='diff2.dat') !2nd derivative

      do i = 0, 190
            x = 1 + dble(i)/10.0
            diff1 = (f(x+h) - f(x-h)) / (2.0*h) !1st derivative
            diff2 = (f(x+h) - 2*f(x) + f(x-h)) / (h**2) !2nd derivative
            write(1, *) x, diff1
            write(2, *) x, diff2
      enddo

      close(1) ! Closing file 1
      close(2) ! Closing file 2
      stop
      end

!     Given function
      real*8 function f(x)
      real*8 x
            f = sin(x*x) * cos(x*x*x)
      return
      end