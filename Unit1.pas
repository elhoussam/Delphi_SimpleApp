unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Unit2, Vcl.ComCtrls ;

type
  TMainForm = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    MyDatePicker: TDateTimePicker;
    Label1: TLabel;
    CreditLbl : TLabel;    //To show the total of Credit
    DebitLbl : TLabel;     //To show the total of Debit
    FilterBtn: TButton;    //To apply the filter when the click event is triggered
    ClearBtn: TButton;     //To clear the filter
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FilterBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

// My Own function
// input : string which contain [Credit , Debit] : name of field
// functionality :walkthrough every element in this column and collect values
// output : the total of ( Credit or Debit ) according to the applied filter
function GetTheAverageOf(mysrt:string ):double ;
var i  : integer ;
total : double ; // contain the final result
begin
  total := 0 ;
  MyownDM.Mytbl.DisableControls ;  // disable any external operation
  MyownDM.Mytbl.First ;            // select the first element in the table
  while not( MyownDM.Mytbl.Eof ) do// walkthrought every element & collect values
  begin
    total := total + MyownDM.Mytbl.FieldByName( mysrt ).AsFloat ;
    MyownDM.Mytbl.Next ;       // step up into the next element
  end;
  MyownDM.Mytbl.EnableControls ;
  Result := total ; // return the total as result
end;



procedure TMainForm.FilterBtnClick(Sender: TObject);
var
  date : TDate ;
begin
  // extract the selected date from date picker
  date := MyDatePicker.Date ;
  // Put the filter of date
  MyownDM.Mytbl.Filtered := false ;
  MyownDM.Mytbl.Filter := 'Dt = ' + QuotedStr( DateToStr(date) );
  MyownDM.Mytbl.Filtered := true ;
  // set new values for the Credit and Debit label
  CreditLbl.Caption := 'Total de Credit : ' + FloatToStr( GetTheAverageOf('Credit') ) ;
  DebitLbl.Caption := 'Total de Debit : ' + FloatToStr( GetTheAverageOf('Debit') ) ;

end;

// procedure when the clearbtn is clicked
procedure TMainForm.ClearBtnClick(Sender: TObject);
begin

  // clear the label caption
  DebitLbl.Caption := '';
  CreditLbl.Caption := '';
  // disable the date filter
  MyownDM.Mytbl.Filtered := false ;
  MyownDM.Mytbl.Filter := '' ;
  MyownDM.Mytbl.Filtered := true ;
end;

// procedure when the title of DBGrid is click
procedure TMainForm.DBGrid1TitleClick(Column: TColumn);
{$J+}const PreviousColumnIndex : integer = -1;
{$J-}
begin
  // Try bloc contain instr that remove the fsBold Style
  // from the previous column
    try
     DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
     DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
     except
    end;

  // the following instr that add the fsBold Style
  // to the current column
   Column.title.Font.Style := Column.title.Font.Style + [fsBold];
   PreviousColumnIndex := Column.Index;
  // The if else block check if the column
  // was Order (ASC or DESC) and change it
   if (Pos( WideString(Column.Field.FieldName) , MyownDM.Mytbl.Sort ) = 1) and
      (Pos(WideString(' DESC'), MyownDM.Mytbl.Sort)= 0) then
      MyownDM.Mytbl.Sort := Column.Field.FieldName + ' DESC'
   else
      MyownDM.Mytbl.Sort := Column.Field.FieldName + ' ASC';
end;

end.

