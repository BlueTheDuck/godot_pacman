// This is just an example
// let listener = TcpListener::bind("127.0.0.1:4040")?;
// println!("Waiting conneciton");
// let (mut socket, addr): (std::net::TcpStream, std::net::SocketAddr) = listener.accept()?;
// let mut godot = godot::Godot::new(socket);
// godot.connect()?;
// println!("Connection stablished");
// loop {
//     godot.request_update()?;
//     let send: Command = Command::Direction(Direction::Right);
//     godot.send_command(send)?;
//     std::thread::sleep(std::time::Duration::from_secs(1));
// }
