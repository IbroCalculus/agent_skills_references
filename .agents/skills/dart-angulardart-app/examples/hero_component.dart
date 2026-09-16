import 'package:angular/angular.dart';

@Component(
  selector: 'hero-detail',
  template: '''
    <div *ngIf="hero != null" class="hero-box">
      <h2>{{hero['name']}} Details</h2>
      <p>ID: {{hero['id']}}</p>
      <input [(ngModel)]="hero['name']" placeholder="Edit name"/>
      <button (click)="onSave()">Save</button>
    </div>
  ''',
  directives: [coreDirectives],
)
class HeroDetailComponent {
  @Input()
  Map<String, dynamic>? hero;

  @Output()
  final save = EventEmitter<void>();

  void onSave() {
    save.emit();
  }
}
