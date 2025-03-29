output "map" {
  value = {
    id = aws_vpc.main.id
    subnet = {
      public = {
        id = aws_subnet.public.id
      }
      private = {
        id = aws_subnet.private.id
      }
    }
  }
}