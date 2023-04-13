program histogram
    ! Nicholas Maynard
    ! CSI 501
    ! Homework 10
    ! 03/06/2023
    ! This program is meant to bin the data generated out in our first program.
  
    ! Clear out the memory
    implicit none
  
    ! Declare our Variables
    real :: Num, x, BoxWidth
    real :: Histstart = 10.0
    real :: HistRange = 20.0 
    integer :: NBoxes = 100
    integer, allocatable :: Hist(:)
    integer :: iHist, BadCount, i

    ! Open our input file
    open(13, file = 'Bumps.txt') 

    ! Allocate the memory for our histogram array
    allocate(Hist(NBoxes))

    ! Generate our box width
    BoxWidth = HistRange / float(NBoxes)

    do i=1, 20000
        ! Read in our number from our file.
        read(13,*) Num
        
        ! Get the index in the hist for the coresponding value.
        iHist = Int((Num-Histstart) * float(NBoxes) / HistRange) 
        
        ! Check if it's a valid histogram number
        if (iHist .ge. 1 .and. iHist .le. NBoxes) then
            Hist(iHist) = Hist(iHist) + 1
        else
        ! Increase bad count if it's not a valid number.
            BadCount = BadCount + 1
        endif
    enddo


    ! Open our output file
    open(42, file = 'Histogram.txt') 
    do i = 1, nBoxes
        x = (float(i) - 0.5) * BoxWidth + HistStart
        write(42,*) x, Hist(i) 
    enddo

    ! Clean up memory.
    deallocate(Hist)
  
  
  
  end program histogram