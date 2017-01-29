
<script>
    $(document).ready(function() {
        var pathname = window.location.pathname;
        $('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
    })
</script>

<footer class="footer">
    <div class="container">
        <div class="float-left">
            <p class="text-muted">2017 - Aktors Evaluation Task</p>
        </div>
    </div>
</footer>