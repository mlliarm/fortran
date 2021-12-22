!Purpose: Calculate the Fresnel cosine and sine integrals for given uper
!         limit b.
!
!Author: MiLia
!-------------------------------------------------------------------------
        program nquadr
      
        implicit none
        real*8 a, b, h, sum1, x, s2, c2
        integer n, i
        parameter(a=0, n=10000)
        real*8 si(0:n), ci(0:n)
        external s2, c2

!       open(1, file='cf.dat') ! Opening the files to be written
!       open(2, file='sf.dat')

        write(*,*) 'Insert b'
        read(*,*) b

        h = (b - a) / dble(n)

!       Mapping matrix->function values.

        do i = 0, n, 1
            x = a + i*h
            si(i) = s2(x)           
            ci(i) = c2(x)
        enddo

!       Calling the subroutines.

        call simpson(n,h,si,sum1)
!       write(1,*) 'FresnelS(0, b)=',sum1
        write(*,*) 'FresnelS(0, b)=', sum1

        call simpson(n,h,ci,sum1)
!       write(2,*) 'FresnelC(0, b)=',sum1
        write(*,*) 'FresnelC(0, b)=', sum1

!       close(1) ! Closing the written files.
!       close(2)

        stop
        end
        
!       The subroutine simpson.
!       ------------------------------
        subroutine simpson(n, h, f, sum1)
        real*8 f(0:n)
        real*8 h, sum1
        integer n, i

        sum1 = f(0)
        
        do i = 1, n-1, 2
            sum1 = sum1 + 4 * f(i)
        enddo

        do i = 2, n-2, 2
            sum1 = sum1 + 2 * f(i)
        enddo

        sum1 = sum1 + f(n)
        sum1 = h * sum1 / 3.
        return
        end

!       The functions to be integrated.
!       -------------------------------
!       f1(x)=sin(x**2)
        real*8 function s2(x)
        real*8 x        
            s2 = sin(x**2)
        return 
        end

!       f2(x)=cos(x**2)
        real*8 function c2(x)
        real*8 x        
            c2 = cos(x**2)
        return
        end


