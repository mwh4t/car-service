% rebase('layout.tpl', title='Error', year=year)
<div class="alert alert-danger text-center mt-5">
    <h2>Error</h2>
    <p>{{ message }}</p>
    <a href="/about" class="btn btn-secondary">Back to About</a>
</div>