module energy
    implicit none

contains

    !subroutine u_bonded(forcefield)
    !    implicit none


    !    select case(forcefield)
    !    case("TraPPE")
    !        call u_lennardjones(epsilon, sigma)
    !        call u_ewaldsum()
    !    end select

    !end subroutine

    subroutine u_nonbonded()
        implicit none 
        print *, "Stuff goes here"
    end subroutine

end module energy
