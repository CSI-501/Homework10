program brownian
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 10
    ! 03/06/2023
    ! This program is meant to ask the user for a seed and number then generate
    ! random brownian motion points.
  
    ! Clear out the memory
    implicit none
  
    ! Declare our Variables
    integer :: seed, n, i
    real :: rnum
    integer :: y = 0
    integer :: x = 0

    ! Ask the user for our input variables
    print*,'Enter a seed:'
    read*, seed

    ! Set up our random number generator
    call srand(seed)

    ! Enter our number.
    print*, 'Enter a number n:'
    read*, n

    ! Open our output file
    open(13, file='Brownian.txt')

    ! Generate our Brownian Motion.
    do i = 1, n
        rnum = rand()
        if (rnum < 0.25) then
            x = x + 1
        else if (rnum < 0.5) then
            y = y + 1
        else if (rnum < 0.75) then
            x = x - 1
        else 
            y = y - 1
        endif 
        ! Write out our results.
        write(13,*) x, y 
    enddo 




end program brownian