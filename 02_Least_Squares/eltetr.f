!Author:MiLia
!Contact: milia@protonmail.com
!Date: 2.11.09
!
!Purpose: Least square fit of given data.
!
!--------------------------------------------------

      program eltetr
      implicit none
      real*8 sums,sumx,sumxx,sumy,sumxy,a,b,sum,delta,r2,sa,sb,sumyy
      integer nmax,n,i
      parameter (nmax=2000)
      real*8 x(0:nmax),y(0:nmax),z(0:nmax),sy(0:nmax)
      external sum
      
      open(1,file='xys.in')
      open(2,file='abr2.out')
      
      write(*,*) 'Give the number of  data, n'
      read(*,*) n

       do i=0,n
         read(1,*) y(i),x(i),sy(i)
!        read(*,*) x(i),y(i),sy(i)
         z(i)=1.
       enddo

!     Calculating the sums
!     Ypologismos a8roismatwn

       sums=sum(z,z,sy,n)
       sumx=sum(z,x,sy,n)
       sumxx=sum(x,x,sy,n)    !sumyy=sum(y,y,sy,n)
       sumy=sum(z,y,sy,n)
       sumxy=sum(x,y,sy,n)
       
       delta=sums*sumxx-sumx*sumx

!     Calculating of a,b,sa,sb for linear fit y=a+b*x
!     sa,sb are the statistical errors of a and b
!     Ypologismos twn a,b,sa,sb gia ey8eia y=a+b*x

       b=(sums*sumxy-sumx*sumy)/delta
       sb=sqrt(sums/delta)
       a=(sumxx*sumy-sumx*sumxy)/delta
       sa=sqrt(sumxx/delta)
      
       write(*,*) 'a,sa,b,sb=',a,sa,b,sb
       write(2,*) 'y=a+b*x'
       write(2,*) 'a=',a
       write(2,*) 'sa=',sa
       write(2,*) 'b=',b
       write(2,*) 'sb=',sb
      stop
      end

!     Calculating function of the sum Sum(xy/z^2)
      real*8 function sum(x,y,z,n)
!     Calculating the sum Sum(xy/z^2)
      implicit none
      integer n,i
      real*8 x(0:n),y(0:n),z(0:n)           
       sum=0.0      
       do i=0,n
        if (z(i).ne.0.0) then
         sum=sum+ (x(i)*y(i)/z(i)*z(i))     
        else
          sum=sum +x(i)*y(i)
        endif  
       enddo
      return
      end
