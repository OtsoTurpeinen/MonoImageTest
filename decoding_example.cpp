

void VideoGraphicsArray::DrawMonochrome(common::uint32_t x,common::uint32_t y,const common::uint8_t* array,const common::uint32_t len,const common::uint32_t width)
{
    
    uint8_t *where = GetFrameBufferSegment() + 320*y+x;
    uint32_t dx;
    uint32_t dy;
    uint32_t acc = 0;
    uint8_t c;
    for(uint32_t j = 1; j < len; j += 2)
    {
        acc += array[j-1];
        c = array[j];
        for (uint32_t l = 0; l < c; l++) {
            dx = (acc+l)%width;
            dy = (acc+l)/width;
            where[dx+dy*320] = 0x3f;
        }
        acc+=c;
    }
    where+=320;
}