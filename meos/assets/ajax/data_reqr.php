<?php
    require "../../requires/config.php";
    if (!$_SESSION['loggedin']) {
        Header("Location: login");
    }
    $profiles = $con->query("SELECT * FROM profiles ORDER BY lastsearch DESC LIMIT 5");
    $recentsearch_array = [];
    while ($data = $profiles->fetch_assoc()) {
        $recentsearch_array[] = $data;
    }
    $reports = $con->query("SELECT * FROM reports ORDER BY created DESC LIMIT 5");
    $recentreports_array = [];
    while ($data = $reports->fetch_assoc()) {
        $recentreports_array[] = $data;
    }
    $vehicles = $con->query("SELECT * FROM vehicles ORDER BY lastsearch DESC LIMIT 5");
    $recentvehicles_array = [];
    while ($data = $reports->fetch_assoc()) {
        $recentvehicles_array[] = $data;
    }
    $name = explode(" ", $_SESSION["name"]);
    $firstname = $name[0];
    $last_word_start = strrpos($_SESSION["name"], ' ') + 1;
    $lastname = substr($_SESSION["name"], $last_word_start);
 if(!empty($recentreports_array)) { ?>
    <?php foreach($recentreports_array as $report) {?>
        <form method="GET" action="reports">
            <input type="hidden" name="type" value="show">
            <input type="hidden" name="reportid" value="<?php echo $report['id']; ?>">
            <button type="submit" class="btn btn-panel panel-item" style="text-align:left!important;">
                <h5 class="panel-title">#<?php echo $report['id']; ?> <?php echo $report['title']; ?></h5>
                <p class="panel-author">door: <?php echo $report['author']; ?></p>
            </button>
        </form>
    <?php }?>
<?php } else { ?>
        <p>Geen personen opgezocht..</p>
<?php } ?>