provider "aws" {
    region = "ap-southeast-6" 
}

resource "aws_iam_user" "myUser" {  
    name = "Niko"

}

resource "aws_iam_policy" "customPolicy" {
    name = "GlacierEFSEC2"
    
    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:ReplaceRouteTableAssociation",
				"ec2:ModifyManagedPrefixList",
				"ec2:CreateIpamPool",
				"ec2:ResetInstanceAttribute",
				"ec2:ResetEbsDefaultKmsKeyId",
				"ec2:ModifyInstanceMetadataDefaults",
				"ec2:ModifyInstanceNetworkPerformanceOptions",
				"ec2:ModifyVpnConnectionOptions",
				"ec2:ReleaseIpamPoolAllocation",
				"ec2:DisassociateRouteServer",
				"ec2:DeleteNetworkInsightsAnalysis",
				"ec2:UnassignPrivateIpAddresses",
				"ec2:ModifyRouteServer",
				"glacier:PurchaseProvisionedCapacity",
				"ec2:DisableImageDeprecation",
				"ec2:DeleteLocalGatewayRouteTable",
				"ec2:CreateTransitGatewayMeteringPolicyEntry",
				"ec2:DeleteTransitGatewayPeeringAttachment",
				"ec2:ImportKeyPair",
				"ec2:CreateInstanceConnectEndpoint",
				"ec2:CancelCapacityReservationFleets",
				"ec2:ProvisionIpamByoasn",
				"ec2:CreateVerifiedAccessEndpoint",
				"ec2:ReplaceNetworkAclAssociation",
				"ec2:CreateVpcEndpointServiceConfiguration",
				"ec2:CreateDelegateMacVolumeOwnershipTask",
				"ec2:CopyVolumes",
				"ec2:ModifyInstanceMaintenanceOptions",
				"ec2:DeleteNatGateway",
				"ec2:CancelCapacityReservation",
				"ec2:EnableTransitGatewayRouteTablePropagation",
				"ec2:DeleteIpamInternetRegistryAssociation",
				"glacier:ListVaults",
				"ec2:ModifyVpcEndpoint",
				"ec2:ModifyInstanceCapacityReservationAttributes",
				"ec2:CreatePublicIpv4Pool",
				"ec2:DeleteSpotDatafeedSubscription",
				"ec2:ImportVolume",
				"ec2:CreateVerifiedAccessGroup",
				"ec2:ModifyFleet",
				"ec2:DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
				"ec2:CreateLocalGatewayVirtualInterface",
				"ec2:RequestSpotFleet",
				"ec2:CreateSubnetCidrReservation",
				"ec2:DeleteTransitGatewayMulticastDomain",
				"ec2:PurchaseCapacityBlockExtension",
				"ec2:DeleteVerifiedAccessInstance",
				"ec2:PurchaseCapacityBlock",
				"ec2:ModifyReservedInstances",
				"ec2:ReleaseAddress",
				"ec2:CreateTrafficMirrorTarget",
				"ec2:CancelDeclarativePoliciesReport",
				"ec2:ModifyTrafficMirrorFilterRule",
				"ec2:CreateClientVpnRoute",
				"ec2:ResetFpgaImageAttribute"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_user_policy_attachment" "PolicyBind" {
    user = aws_iam_user.myUser.name
    policy_arn = aws_iam_policy.customPolicy.arn
}