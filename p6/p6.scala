object main{
    def up(n: Int) : Int = n match{
        case 1 => 1
        case _ => up(n-1) + n*n
    }

    def down(n: Int) : Int = n match {
        case 1 => 1
        case _ => scala.math.pow((scala.math.sqrt(down(n-1)) + n), 2).asInstanceOf[Int];
    }
}
println(main.down(100) - main.up(100))


// vim: set ts=4 sw=4 et:
