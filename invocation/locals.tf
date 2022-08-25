locals {
  tags = merge(
    {
      #Environment = var.environment
    },
    #var.tags
  )
}