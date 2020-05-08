tableextension 51000 xts_PurchSetupExt extends "Purchases & Payables Setup"
{
    fields
    {
        field(50000; BuktiBankKeluarNos; Code[20])
        {
            Caption = 'Bukti Bank Keluar Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}