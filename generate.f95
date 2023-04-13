program generate
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 10
    ! 03/13/2023
    ! This program generates random numbers.
  
    ! Clear out the memory
    implicit none
  
    ! Declare our Variables
    integer :: seed
    integer*8 :: i
    real :: rnum, BoxMuller

    ! Ask the user for our input variables
    print*,'Enter a seed:'
    read*, seed

    ! Set up our random number generator
    call srand(seed)

    ! Open output file
    open(13,file=('Bumps.txt'))

    ! Generate our first set of random numbers
    do i = 1, 13000
        rnum = BoxMuller(22.0, 2.5)
        write(13,*) rnum
    enddo

    ! Generate our second set of random numbers
    do i =1, 7000
        rnum = BoxMuller(15.5, 1.0)
        write(13,*) rnum
    enddo
end program generate

function BoxMuller(mean, std) result(y)
    ! Remove space in memory
    implicit none
    ! Initialize variables for the function
    real :: mean, std, rnum1, x1, x2, w, y
  
    do ! Infinite do loop until no rejection 
        x1 = 2.d0 * rand() - 1.d0
        x2 = 2.d0 * rand() - 1.d0
        w = x1**2 + x2**2
        if (w .lt. 1.d0) exit ! Valid numbers 
    enddo
    ! Create gaussian random number
    w = sqrt((-2.0 * log(w))/w) 
    rnum1 = x1 * w
    y = rnum1 * std + mean  
  end function