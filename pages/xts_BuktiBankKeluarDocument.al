page 51001 xts_BuktiBankKeluarDocument
{
    PageType = Document;
    UsageCategory = None;
    SourceTable = xts_BuktiBankKeluarHeader;
    Caption = 'Bukti Bank Keluar';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    begin
                        AssistEdit(xRec);
                    end;
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
                    Importance = Promoted;
                }

                field(ShortcutDimension1Code; ShortcutDimension1Code)
                {
                    ApplicationArea = All;
                }

                field(ShortcutDimension2Code; ShortcutDimension2Code)
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
            part(Lines; xts_BuktiBankKeluarSubPage)
            {
                ApplicationArea = All;
                SubPageLink = DocumentNo = field(No);
                UpdatePropagation = Both;
            }
        }
    }

    // trigger OnOpenPage()
    // var
    //     myInt: Integer;
    // begin
    //     CurrPage.Lines.Page.SendDocumentNo(No);
    // end;
}