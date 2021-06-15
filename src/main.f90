program main
    implicit none
    use fileio  
    use energy

    call read_user_input     

    call system_initialize

    call run_mc

end program main
