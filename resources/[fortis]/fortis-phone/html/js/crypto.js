var SelectedCryptoTab = Config.DefaultCryptoPage;
var ActionTab = null;
$(".cryptotab-"+SelectedCryptoTab).css({"display":"block"});
$(".crypto-header-footer").find('[data-cryptotab="'+SelectedCryptoTab+'"]').addClass('crypto-header-footer-item-selected');

var CryptoData = [];
CryptoData.Portfolio = 0;
CryptoData.Worth = 1000; 
CryptoData.WalletId = null;
CryptoData.History = [];

function SetupCryptoData(Crypto) {
    CryptoData.History = 1;
    CryptoData.Portfolio = (Crypto.Portfolio).toFixed(0);
    CryptoData.Worth = Crypto.Worth;
    CryptoData.WalletId = Crypto.WalletId;


    $(".crypto-action-page-wallet").html("Wallet: "+CryptoData.Portfolio+" bitcoin");
    $(".crypto-walletid").html(CryptoData.WalletId);
    $(".cryptotab-course-list").html("");
    if (CryptoData.History.length > 0) {
        CryptoData.History = CryptoData.History.reverse();
        $.each(CryptoData.History, function(i, change){
            var PercentageChange = ((change.NewWorth - change.PreviousWorth) / change.PreviousWorth) * 100;
            var PercentageElement = '<span style="color: green;" class="crypto-percentage-change"><i style="color: green; transform: rotate(-45deg);" class="fas fa-arrow-right"></i> +('+Math.ceil(PercentageChange)+'%)</span>';
            if (PercentageChange < 0 ) {
                PercentageChange = (PercentageChange * -1);
                PercentageElement = '<span style="color: red;" class="crypto-percentage-change"><i style="color: red; transform: rotate(125deg);" class="fas fa-arrow-right"></i> -('+Math.ceil(PercentageChange)+'%)</span>';
            }
            var Element =   '<div class="cryptotab-course-block">' +
                                '<i class="fas fa-exchange-alt"></i>' +
                                '<span class="cryptotab-course-block-title">Course change</span>' +
                                '<span class="cryptotab-course-block-happening"><span style="font-size: 1.3vh;">€'+change.PreviousWorth+'</span> to <span style="font-size: 1.3vh;">€'+change.NewWorth+'</span>'+PercentageElement+'</span>' +
                            '</div>';
    
            $(".cryptotab-course-list").append(Element);                
        });
    }

    $(".crypto-portofolio").find('p').html(Math.ceil(CryptoData.Portfolio));
    $(".crypto-course").find('p').html("€"+CryptoData.Worth);
    $(".crypto-volume").find('p').html("€"+Math.ceil(CryptoData.Portfolio * CryptoData.Worth));
}

function UpdateCryptoData(Crypto) {
    CryptoData.History = 1;
    CryptoData.Portfolio = (Crypto.Portfolio).toFixed(0);
    CryptoData.Worth = Crypto.Worth;
    CryptoData.WalletId = Crypto.WalletId;

    $(".crypto-action-page-wallet").html("Wallet: "+CryptoData.Portfolio+" bitcoin");
    $(".crypto-walletid").html(CryptoData.WalletId);
    $(".cryptotab-course-list").html("");
    if (CryptoData.History.length > 0) {
        CryptoData.History = CryptoData.History.reverse();
        $.each(CryptoData.History, function(i, change){
            var PercentageChange = ((change.NewWorth - change.PreviousWorth) / change.PreviousWorth) * 100;
            var PercentageElement = '<span style="color: green;" class="crypto-percentage-change"><i style="color: green; transform: rotate(-45deg);" class="fas fa-arrow-right"></i> +('+Math.ceil(PercentageChange)+'%)</span>';
            if (PercentageChange < 0 ) {
                PercentageChange = (PercentageChange * -1);
                PercentageElement = '<span style="color: red;" class="crypto-percentage-change"><i style="color: red; transform: rotate(125deg);" class="fas fa-arrow-right"></i> -('+Math.ceil(PercentageChange)+'%)</span>';
            }
            var Element =   '<div class="cryptotab-course-block">' +
                                '<i class="fas fa-exchange-alt"></i>' +
                                '<span class="cryptotab-course-block-title">Course change</span>' +
                                '<span class="cryptotab-course-block-happening"><span style="font-size: 1.3vh;">€'+change.PreviousWorth+'</span> to <span style="font-size: 1.3vh;">€'+change.NewWorth+'</span>'+PercentageElement+'</span>' +
                            '</div>';
    
            $(".cryptotab-course-list").append(Element);                
        });
    }

    $(".crypto-portofolio").find('p').html(CryptoData.Portfolio);
    $(".crypto-course").find('p').html("€"+CryptoData.Worth);
    $(".crypto-volume").find('p').html("€"+Math.ceil(CryptoData.Portfolio * CryptoData.Worth));
}

function RefreshCryptoTransactions(data) {
    $(".cryptotab-transactions-list").html("");
    if (data.CryptoTransactions.length > 0) {
        data.CryptoTransactions = (data.CryptoTransactions).reverse();
        $.each(data.CryptoTransactions, function(i, transaction){
            var Title = "<span style='color: #19a17d;'>"+transaction.TransactionTitle+"</span>"
            if (transaction.TransactionTitle == "Withdrawn") {
                Title = "<span style='color: red;'>"+transaction.TransactionTitle+"</span>"
            }
            var Element = '<div class="cryptotab-transactions-block"> <i class="fas fa-exchange-alt"></i> <span class="cryptotab-transactions-block-title">'+Title+'</span> <span class="cryptotab-transactions-block-happening">'+transaction.TransactionMessage+'</span></div>';
            
            $(".cryptotab-transactions-list").append(Element);                
        });
    }
}

$(document).on('click', '.crypto-header-footer-item', function(e){
    e.preventDefault();

    var CurrentTab = $(".crypto-header-footer").find('[data-cryptotab="'+SelectedCryptoTab+'"]');
    var SelectedTab = this;
    var HeaderTab = $(SelectedTab).data('cryptotab');

    if (HeaderTab !== SelectedCryptoTab) {
        $(CurrentTab).removeClass('crypto-header-footer-item-selected');
        $(SelectedTab).addClass('crypto-header-footer-item-selected');
        $(".cryptotab-"+SelectedCryptoTab).css({"display":"none"});
        $(".cryptotab-"+HeaderTab).css({"display":"block"});
        SelectedCryptoTab = $(SelectedTab).data('cryptotab');
    }
});

$(document).on('click', '.cryptotab-general-action', function(e){
    e.preventDefault();

    var Tab = $(this).data('action');

    $(".crypto-action-page").css({"display":"block"});
    $(".crypto-action-page").animate({
        left: 0,
    }, 300);
    $(".crypto-action-page-"+Tab).css({"display":"block"});
    QB.Phone.Functions.HeaderTextColor("black", 300);
    ActionTab = Tab;
});

$(document).on('click', '#cancel-crypto', function(e){
    e.preventDefault();

    $(".crypto-action-page").animate({
        left: -30+"vh",
    }, 300, function(){
        $(".crypto-action-page-"+ActionTab).css({"display":"none"});
        $(".crypto-action-page").css({"display":"none"});
        ActionTab = null;
    });
    QB.Phone.Functions.HeaderTextColor("white", 300);
});

function CloseCryptoPage() {
    $(".crypto-action-page").animate({
        left: -30+"vh",
    }, 300, function(){
        $(".crypto-action-page-"+ActionTab).css({"display":"none"});
        $(".crypto-action-page").css({"display":"none"});
        ActionTab = null;
    });
    QB.Phone.Functions.HeaderTextColor("white", 300);
}

$(document).on('click', '#buy-crypto', function(e){
    e.preventDefault();

    document.getElementById("buy-crypto").disabled = true;

    var Coins = $(".crypto-action-page-buy-crypto-input-coins").val();
    var Price = $(".crypto-action-page-buy-crypto-input-money").val();

    if ((Coins !== "") && (Price !== "")) {
        if (QB.Phone.Data.PlayerData.money.bank >= Price) {
            if (Coins > 1000) {
                QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je wallet zit dan tegen de limiet aan! (1000 bitcoins)", "#badc58", 1500);
                setTimeout(() => {
                    document.getElementById("buy-crypto").disabled = false;
                }, 1000);
            } else {
                if (QB.Phone.Data.PlayerData.money.crypto >= 1000) {
                    QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je wallet zit tegen de limiet aan! (1000 bitcoins)", "#badc58", 1500);
                    setTimeout(() => {
                        document.getElementById("buy-crypto").disabled = false;
                    }, 1000);
                } else {
                    if ((parseInt(QB.Phone.Data.PlayerData.money.crypto) + parseInt(Coins)) > 1000) {
                        QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je wallet zit dan tegen de limiet aan! (1000 bitcoins)", "#badc58", 1500);
                        setTimeout(() => {
                            document.getElementById("buy-crypto").disabled = false;
                        }, 1000);
                    } else {
                        $.post('http://fortis-phone/BuyCrypto', JSON.stringify({
                            Coins: Coins,
                            Price: Price,
                        }), function(CryptoData){
                            if (CryptoData !== false) {
                                UpdateCryptoData(CryptoData)
                                CloseCryptoPage()
                                QB.Phone.Data.PlayerData.money.crypto = parseInt(QB.Phone.Data.PlayerData.money.crypto) + parseInt(Coins);
                                QB.Phone.Data.PlayerData.money.bank = parseInt(QB.Phone.Data.PlayerData.money.bank) - parseInt(Price);
                                QB.Phone.Notifications.Add("fas fa-university", "Fortis-bank", "&euro; "+Price+",- is er van je bank afgeschreven!", "#badc58", 2500);
                                setTimeout(() => {
                                    document.getElementById("buy-crypto").disabled = false;
                                }, 1000);
                            } else {
                                setTimeout(() => {
                                    document.getElementById("buy-crypto").disabled = false;
                                }, 1000);
                                QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg geld...", "#badc58", 1500);
                            }
                        });
                    }
                }
            }
        } else {
            setTimeout(() => {
                document.getElementById("buy-crypto").disabled = false;
            }, 1000);
            QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg geld...", "#badc58", 1500);
        }
    } else {
        QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Vul alle velden in!", "#badc58", 1500);
    }
}); 

$(document).on('click', '#sell-crypto', function(e){
    e.preventDefault();

    var Coins = $(".crypto-action-page-sell-crypto-input-coins").val();
    var Price = $(".crypto-action-page-sell-crypto-input-money").val();

    if ((Coins !== "") && (Price !== "")) {
        if (CryptoData.Portfolio >= parseInt(Coins)) {
            $.post('http://fortis-phone/SellCrypto', JSON.stringify({
                Coins: Coins,
                Price: Price,
            }), function(CryptoData){
                if (CryptoData !== false) {
                    UpdateCryptoData(CryptoData)
                    CloseCryptoPage()
                    QB.Phone.Data.PlayerData.money.bank = parseInt(QB.Phone.Data.PlayerData.money.bank) + parseInt(Price);
                    QB.Phone.Notifications.Add("fas fa-bitcoin", "Fortis-bank", "&euro; "+Price+",- is toegevoegd aan de bank!", "#badc58", 2500);
                } else {
                    QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg Bitcoins..", "#badc58", 1500);
                }
            });
        } else {
            QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg Bitcoins..", "#badc58", 1500);
        }
    } else {
        QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Vul alle velden in!", "#badc58", 1500);
    }
});

$(document).on('click', '#transfer-crypto', function(e){
    e.preventDefault();

    var Coins = $(".crypto-action-page-transfer-crypto-input-coins").val();
    var WalletId = $(".crypto-action-page-transfer-crypto-input-walletid").val();

    if ((Coins !== "") && (WalletId !== "")) {
        if (CryptoData.Portfolio >= Coins) {
            if (WalletId !== CryptoData.WalletId) {
                $.post('http://fortis-phone/TransferCrypto', JSON.stringify({
                    Coins: Coins,
                    WalletId: WalletId,
                }), function(CryptoData){
                    if (CryptoData == "notenough") {
                        QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg Bitcoins..", "#badc58", 1500);
                    } else if (CryptoData == "notvalid") {
                        QB.Phone.Notifications.Add("fas fa-university", "Crypto", "Deze Bitcoin wallet bestaat niet!", "#badc58", 2500);
                    } else {
                        UpdateCryptoData(CryptoData)
                        CloseCryptoPage()
                        QB.Phone.Notifications.Add("fas fa-university", "Crypto", "Je hebt "+Coins+",- naar "+WalletId+" overgemaakt!", "#badc58", 2500);
                    }
                });
            } else {
                QB.Phone.Notifications.Add("fas fa-university", "Crypto", "Je kan niks naar jezelf overmaken..", "#badc58", 2500);
            }
        } else {
            QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Je hebt niet genoeg Bitcoins..", "#badc58", 1500);
        }
    } else {
        QB.Phone.Notifications.Add("fas fa-bitcoin", "Crypto", "Vul alle velden in!", "#badc58", 1500);
    }
});

$(".crypto-action-page-buy-crypto-input-money").keyup(function(){
    var MoneyInput = this.value

    $(".crypto-action-page-buy-crypto-input-coins").val((MoneyInput / CryptoData.Worth).toFixed(6));
}); 

$(".crypto-action-page-buy-crypto-input-coins").keyup(function(){
    var MoneyInput = this.value

    $(".crypto-action-page-buy-crypto-input-money").val(Math.ceil(CryptoData.Worth * MoneyInput));
});

$(".crypto-action-page-sell-crypto-input-money").keyup(function(){
    var MoneyInput = this.value

    $(".crypto-action-page-sell-crypto-input-coins").val((MoneyInput / CryptoData.Worth).toFixed(6));
}); 

$(".crypto-action-page-sell-crypto-input-coins").keyup(function(){
    var MoneyInput = this.value

    $(".crypto-action-page-sell-crypto-input-money").val(Math.ceil(CryptoData.Worth * MoneyInput));
});