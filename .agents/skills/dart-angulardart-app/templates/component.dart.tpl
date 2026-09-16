import 'package:angular/angular.dart';

@Component(
  selector: 'feature-view',
  template: '''
    <section class="view-content">
      <h1>{{headerTitle}}</h1>
      <ng-content></ng-content>
    </section>
  ''',
  styles: ['''
    .view-content { padding: 24px; }
  '''],
  directives: [coreDirectives],
)
class FeatureViewComponent implements OnInit, OnDestroy {
  @Input()
  String headerTitle = 'Feature';

  @override
  void ngOnInit() {
    // Component initialization
  }

  @override
  void ngOnDestroy() {
    // Cancel subscriptions
  }
}
