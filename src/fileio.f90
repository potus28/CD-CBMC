module fileio
    implicit none

    ! File input 
    integer, parameter :: fh_input = 10
    character (len=256) :: fname_input
    integer :: error_stat
    character (len=256) :: error_msg
    character (len=1), parameter :: delimiter = "="
    integer :: delimiter_positon
    integer :: line_number = 0
    character (len=256):: line_contents, variable_name, variable_value

    ! Input File Variables
    character (len=20):: title
    character (len=10):: ensemble
    integer :: cycles
    double precision :: temp
    double precision :: box
    character (len=20):: coordfile
    character (len=20):: ff
    character (len=20):: ff_file
    character (len=20):: coulomb
    double precision :: rcut

    !Open Input File
    call get_command_argument(1, fname_input)
    open(fh_input, file=fname_input, iostat = error_stat, iomsg = error_msg)
    if(error_stat /= 0) then
        print *, "Error Stat: ", error_stat
        print *, "Error: ", trim(error_msg)
        stop
    end if
    !Read User Input
    do while (error_stat == 0)
        read(fh_input, "(A)", iostat = error_stat, iomsg=error_msg) line_contents

        if (error_stat == 0) then
            line_number = line_number + 1
            delimiter_positon = scan(line_contents, delimiter)
            
            variable_name = trim(line_contents(1:delimiter_positon-1))
            variable_value = trim(line_contents(delimiter_positon+1:))
            select case (variable_name)
            
            case ('title')
               read(variable_value, *, iostat=error_stat) title
               print *, 'Read title: ', title

            case ('ensemble')
                read(variable_value, *, iostat=error_stat) ensemble
                print *, 'Read ensemble: ', ensemble          

            case ('cycles')
                read(variable_value, *, iostat=error_stat) cycles
                print *, 'Read cycles: ', cycles

            case ('coordfile')
                read(variable_value, *, iostat=error_stat) coordfile
                print *, 'Read coordfile: ', coordfile

            case ('temp')
                read(variable_value, *, iostat=error_stat) temp
                print *, 'Read temp: ', temp

            case ('box')
                read(variable_value, *, iostat=error_stat) box
                print *, 'Read box: ', box

            case ('ff')
                read(variable_value, *, iostat=error_stat) ff
                print *, 'Read ff: ', ff
 
             case ('ff_file')
                 read(variable_value, *, iostat=error_stat) ff_file
                 print *, 'Read ff_file: ', ff_file         
 
             case ('coulomb')
                 read(variable_value, *, iostat=error_stat) coulomb
                 print *, 'Read coulomb: ', coulomb
 
             case ('rcut')
                 read(variable_value, *, iostat=error_stat) rcut
                 print *, 'Read rcut: ', rcut

            case default
               print *, 'Skipping invalid label at line', line_number
            
            end select

        end if

    end do



end module fileio
