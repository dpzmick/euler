FUNCTION nth_triangle(n) RESULT(res)
    IMPLICIT NONE
    INTEGER, INTENT(in) :: n
    INTEGER :: i, res
    res = 0
    DO i=1,n
        res = res + i
    END DO
END FUNCTION nth_triangle

FUNCTION divisor_count(n) RESULT(cnt)
    IMPLICIT NONE
    INTEGER, INTENT(in) :: n
    INTEGER :: i, cnt
    cnt = 0
    ! can be run without race condition because order of additions doesn't
    ! matter
    !$OMP parallel DO
    DO i=1,SQRT(REAL(n))
        IF (MOD(n,i) == 0) THEN
            cnt = cnt + 2
        END IF
    END DO
END FUNCTION divisor_count

PROGRAM p12
    IMPLICIT NONE
    INTEGER :: nth_triangle, divisor_count
    INTEGER :: x, c, current
    PRINT *,'PROJECT EULER PROBLEM 12'
    PRINT *,'FINDS VALUE OF FIRST TRIANGLE NUMBER WITH OVER x DIVISORS'
    PRINT *,'x = ?'
    READ *,x
    current = 0
    c = 0
    DO
        IF (MOD(current,1000) == 0) then
            PRINT *,'current =',current
        end if

        c = divisor_count(nth_triangle(current))
        if (c >= x) exit
        current = current + 1
    END DO
    PRINT *,"n=",current,"value=",nth_triangle(current)
END PROGRAM
