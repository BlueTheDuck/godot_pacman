pub type CommandBuf = [u8; 2]; 
pub type ByteStream = Vec<u8>; 
 
#[derive(Debug)] 
pub enum Direction { 
    Up = 0, 
    Right, 
    Down, 
    Left, 
} 
impl Into<u8> for Direction { 
    fn into(self) -> u8 { 
        match self { 
            Direction::Up => 0, 
            Direction::Right => 1, 
            Direction::Down => 2, 
            Direction::Left => 3, 
        } 
    } 
} 
 
/** 
 * Direction => [FF,N] 
 * Request => [FE,FE] 
 */ 
#[derive(Debug)] 
pub enum Command { 
    Direction(Direction), 
    Request, 
} 
impl Into<CommandBuf> for Command { 
    fn into(self) -> CommandBuf { 
        match self { 
            Self::Direction(d) => [0xFF, d.into()], 
            Self::Request => [0xFE, 0xFE], 
        } 
    }
}

