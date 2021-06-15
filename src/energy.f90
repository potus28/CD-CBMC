module energy
    implicit none

contains
    subroutine u_bonded(forcefield)
        implicit none
        select case(forcefield)
        case("TraPPE")
            call u_lennardjones(epsilon, sigma)
            call u_ewaldsum()


    end subroutine

    subroutine u_nonbonded()
        implicit none
    end subroutine




end module energy