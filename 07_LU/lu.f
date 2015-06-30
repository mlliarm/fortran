!Purpose: Inverts given NxN matrix a.
!Author: MiLia
!Contact milia@protonmail.com
!
!------------------------------------------------------------------------------

      program elgiu
      
      integer n,i,j,k,INFO
      parameter(n=10)
      real a(n,n),b(n,n),c(n,n),IPIV(n),WORK(n)
	open(2,file='ainverted.out')

!	Definition of the matrix a(n,n)               
      do i=1,n
         do j=1,n
           if (i.eq.j) then
              a(i,j)=2.
           else if (i.gt.j) then
              a(i,j)=1.
           else if (i.lt.j) then
              a(i,j)=-1.
           endif

          b(i,j)=a(i,j) 
!          c(i,j)=0.
         enddo
      enddo
      
      call sgetrf(n,n,a,n,IPIV,INFO)
       print*,'INFO_sgetrf=',INFO

        if (INFO.eq.0) then
           continue
        else
           print*,'The inserted matrix a is problematic.'
           return           
        endif

      call sgetri(n,a,n,IPIV,WORK,n,INFO)
       print*,'INFO_sgetri=',INFO

       if (INFO.eq.0) then
           continue
        else
           print*,'The inserted matrix a is problematic.'
           return           
        endif

!     Calculation of C=A*A^(-1):=I(n,n)

!      do i=1,n
!       do j=1,n
!            do k=1,n
!             c(i,j)=c(i,j)+a(i,k)*b(k,j)
!            enddo
!         enddo
!      enddo
      
!      do i=1,n
!         write(*,*) (c(i,j),j=1,n)
!      enddo   
     
	do i=1,n
	   write(2,*) (a(i,j),j=1,n)
	enddo
 
!      print*
!      print*,'the matrix a.'
!       do i=1,n
!         write(*,*) (b(i,j),j=1,n)
!       enddo
      
      print*,' a is now inverted.'
      close(2)
      
      stop
      end
