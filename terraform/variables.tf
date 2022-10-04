variable "ip_addr" {
    type = map
    default = {
	"monitoring" = "192.168.50.40"
	"nginx"      = "192.168.50.10"
	"mysql_master" = "192.168.50.101"
	"mysql_slave"  = "192.168.50.102"
	"app"          = "192.168.50.20"
	"gitlab"       = "192.168.50.31"
	"runner"       = "192.168.50.32"
    }
}