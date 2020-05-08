pageextension 51000 xts_PurchSetupExt extends "Purchases & Payables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field(BuktiBankKeluarNos; BuktiBankKeluarNos)
            {
                ApplicationArea = All;
            }
        }
    }
}