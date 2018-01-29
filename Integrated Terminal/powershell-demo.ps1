# SQLSERVER-DBA.CMD
# Free disk space on drives using Powershell
# 01 May,2010 by Jack Vamvas

foreach ($svr in get-content "powershell-demo-instances.txt"){
    $dt = new-object "System.Data.DataTable"
    $cn = new-object System.Data.SqlClient.SqlConnection "server=$svr;database=master;Integrated Security=sspi"
    $cn.Open()
    $sql = $cn.CreateCommand()
    $svr
    $sql.CommandText = "EXEC master.dbo.xp_fixeddrives"
    $rdr = $sql.ExecuteReader()
    $dt.Load($rdr)
    $cn.Close()
    $dt | Format-Table -autosize
}
