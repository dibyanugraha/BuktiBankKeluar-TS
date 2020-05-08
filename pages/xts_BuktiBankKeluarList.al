page 51000 xts_BuktiBankKeluarList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = xts_BuktiBankKeluarHeader;
    Caption = 'Bukti Bank Keluar List';
    Editable = false;
    CardPageId = xts_BuktiBankKeluarDocument;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field(DocumentDate; DocumentDate)
                {
                    ApplicationArea = All;
                }

                field(BankNo; BankNo)
                {
                    ApplicationArea = All;
                }

                field(BankName; BankName)
                {
                    ApplicationArea = All;
                }

                field(ShortcutDimension1Code; ShortcutDimension1Code)
                {
                    ApplicationArea = All;
                }

                field(ShortcutDimension2Code; ShortcutDimension2Code)
                {
                    ApplicationArea = All;
                }

                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}