C     FortranCode.f      

      INTEGER FUNCTION SUMSQUAREDF(N,A)
      INTEGER A(*)
      WRITE(6,'("-- We are now in the FORTRAN program FortranCode --")')
      WRITE(6,'("Print contents of array A() copied from a[] in C "
     1          "program - note the unit offset")')
      DO I=1,N
        WRITE(6,'(2I5)')I,A(I)
      ENDDO
      WRITE(6,'("Calculate then print out squares of elements with "
     1          "accumulated sums")')
      ISUM=0
      DO I=1,N
        A(I)=A(I)*A(I)
        ISUM=ISUM+A(I)
        WRITE(6,'(3I5)')I,A(I),ISUM
      ENDDO
      SUMSQUAREDF=ISUM
      END
