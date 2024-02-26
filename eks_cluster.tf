# Create EKS cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids         = [aws_subnet.private_subnet.id]
    security_group_ids = [aws_security_group.my_security_group.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_attachment
  ]
}

# Create IAM role for EKS cluster
resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# Attach policies to EKS cluster IAM role
resource "aws_iam_role_policy_attachment" "eks_cluster_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Create EKS node group
resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  scaling_config {
    min_size     = var.min_nodes
    max_size     = var.max_nodes
    desired_size = var.desired_nodes  # Add desired_size attribute
  }

  subnet_ids = [aws_subnet.private_subnet.id]  # Specify the subnets where the EKS nodes will be launched

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_attachment
  ]
}

# Create IAM role for EKS node group
resource "aws_iam_role" "eks_node_role" {
  name               = "eks-node-role"
  assume_role_policy = data.aws_iam_policy_document.node_assume_role_policy.json
}

data "aws_iam_policy_document" "node_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Attach policies to EKS node group IAM role
resource "aws_iam_role_policy_attachment" "eks_node_attachment" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# Apply labels to EKS nodes
resource "aws_eks_node_group_tag_map" "my_node_group_tags" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = aws_eks_node_group.my_node_group.node_group_name
  tags            = var.node_labels
}

# Create a security group for the EKS nodes (adjust rules as needed)
resource "aws_security_group" "my_security_group" {
  name   = "eks-node-security-group"
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-node-security-group"
  }
}