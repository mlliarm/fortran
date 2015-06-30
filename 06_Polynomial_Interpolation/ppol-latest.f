!Purpose:Fitting of a list of points (f(x),x) with (Pn(x),x). 
!Author: MiLia
!Date:24/10/05
!Contact: milia@protonmail.com
!------------------------------------------------------------------
!
!Input: n:
!        x(n),y(n) : a couple of columns which correspond to the 
!                       points (x_i,y_i).
!
!
!-------------------------------------------------------------------

      program Langrange

      implicit none
      integer i,j,n
      parameter (n=20)
      real*8 p,xn(0:n),yn(0:n),f,l,h,xmax,xmin,x
            
      xmin = 0.
      xmax = 10.
      h = (xmax - xmin)/n

      open(1,file='pn.out')! Openning the file with the results
        do i=0,n
          xn(i) = xmin + i*h 
          yn(i) = f(xn(i))
        enddo

        do i = 0,n
	   x = xmin + i*h
           call pol(xn,yn,x,p,n) ! Calling the interpolation algorithm
           write(1,*) p, x
        enddo

      close(1)

      stop 
      end

    
!     The Lagrange Polynomial method

      subroutine pol(xn,yn,x,p,n)
      implicit none 
      integer i,j,n
      real*8 x,xn(0:n),yn(0:n),l,p
        p = 0.
        do i = 0,n
           l = 1.                 !initialization of the coefficients l.
           do j = 0,n
              if (j.eq.i) then goto 10 !Excluding the cases with  xn = xn where infinities come up. 
                 l = l*(x-xn(j))/(xn(i)-xn(j))
 10              continue               
              endif
           enddo
           p = p + l*yn(i)
        enddo
      return
      end

!     The function to be approximated with the polynomial

      real*8 function f(x)
      implicit none
      real*8 x
	f = sin(x)
      return
      end
      
      

      
